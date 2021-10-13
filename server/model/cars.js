const db = require('../db');

async function getDBCars() {
  const { rows } = await db.query(
    'SELECT cars.id,title,image,status,price,miles,year_of_make,description,first_name,last_name FROM cars join owner on owner.id = cars.owner;',
  );
  return rows;
}

async function patchDBCarStatus(carID, newStatus) {
  await db.query('UPDATE cars set status = $1 where id = $2;', [newStatus, carID]);
  return true;
}

async function deleteDBCar(id) {
  await db.query('delete from cars where id = $1;', [id]);
  return true;
}

async function addDBCar(req, owner) {
  await db.query(
    'INSERT INTO cars(title, image, status, price, miles, year_of_make, description, owner) values ($1,$2,$3,$4,$5,$6,$7,$8);',
    [
      req.body.title,
      req.body.image,
      req.body.status,
      req.body.price,
      req.body.miles,
      req.body.yearOfMake,
      req.body.description,
      owner,
    ],
  );
  return true;
}

async function findOwnerDB(firstname, lastname) {
  const { rows } = await db.query('SELECT id from owner where first_name = $1 and last_name = $2;', [
    firstname,
    lastname,
  ]);
  return rows[0];
}

module.exports = { getDBCars, patchDBCarStatus, deleteDBCar, addDBCar, findOwnerDB };
