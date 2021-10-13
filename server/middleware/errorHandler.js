/* eslint no-unused-vars: off */

const errorHandler = (err, req, res, next) => {
  console.log(`ERROR ====> ${err.message}`.red);
  res.send(`ERROR ====> ${err.message}`);
};
const notFound = (req, res) => {
  console.log('Could not find specified route'.bgBlue.black);
  res.send('Could not find specified route');
};

module.exports = { errorHandler, notFound };
