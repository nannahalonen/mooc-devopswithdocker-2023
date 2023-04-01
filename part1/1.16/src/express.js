const express = require('express')
const app = express()
const port = 8080

app.get('/', (req, res) => {
  res.send('Hello World from nannahalonen/mooc-devopswithdocker-2023 and docker hub #3!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})