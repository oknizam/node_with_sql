const mysql = require("mysql2");

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Nizam@17',
  database: 'admin_nizam'
});

connection.connect((err) => {
  if (err) {
    console.error('❌ DB connection failed:', err);
    return;
  }
  console.log('✅ MySQL Connected');
});

module.exports = connection;
