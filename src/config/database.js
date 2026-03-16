import { Sequelize } from 'sequelize';
import logger from '../utils/logger.js';

const sequelize = new Sequelize(
  process.env.DB_NAME || 'celin_db',
  process.env.DB_USER || 'celin_user',
  process.env.DB_PASSWORD || 'password',
  {
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT || 5432,
    dialect: 'postgres',
    logging: (msg) => logger.debug(msg),
    pool: {
      max: 10,
      min: 2,
      acquire: 30000,
      idle: 10000,
    },
    retry: {
      max: 3,
      timeout: 5000,
    },
  }
);

export const initializeDatabase = async () => {
  try {
    await sequelize.authenticate();
    logger.info('Database connection established successfully');
    
    // Sync models
    await sequelize.sync({ alter: true });
    logger.info('Database models synchronized');
  } catch (error) {
    logger.error('Database connection error:', error);
    throw error;
  }
};

export default sequelize;