const { getDBCars, patchDBCarStatus, deleteDBCar, findOwnerDB, addDBCar } = require('../model/cars');

async function getCars(req, res) {
  const result = await getDBCars();
  res.status(200).json(result);
}

async function deleteCar(req, res) {
  const result = await deleteDBCar(req.params.id);
  console.log(result);

  if (result) res.status(200).send('Car deleted');
  else res.status(500).send('There was some error');
}

async function changeStatusCar(req, res) {
  const result = await patchDBCarStatus(req.params.id, req.body.status);
  if (result) res.status(200).send('Status updated');
  else res.status(500).send('There was some error');
}

async function addCar(req, res) {
  const ownerId = await findOwnerDB(req.body.owner.firstName, req.body.owner.lastName);
  const result = await addDBCar(req, ownerId.id);
  if (result) res.status(200).send('Car was added');
  else res.status(500).send('There was some error');
}

module.exports = { getCars, addCar, deleteCar, changeStatusCar };
