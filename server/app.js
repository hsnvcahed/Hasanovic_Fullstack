const express = require('express');
const morgan = require('morgan');
const helmet = require('helmet');
const path = require('path');
const cors = require('cors');
const { errorHandler, notFound } = require('./middleware/errorHandler');
const router = require('./routes/cars');

require('colors');
require('dotenv').config();

const app = express();

app.use(morgan('dev'));
app.use(cors());

app.use(express.static(path.join(__dirname, '/public')));
app.use(helmet());

app.use(express.json());
app.use(router);
app.use(errorHandler);
app.use(notFound);

const PORT = process.env.PORT ?? 5000;

app.listen(PORT);
