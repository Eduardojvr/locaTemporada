const express = require('express');
const app = express();
const port = 3333;

app.use(express.static('front'));

app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});
