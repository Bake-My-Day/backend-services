import express from "express";
import cors from "cors";

const express = require ("express")
const app = express()
const port = 3003
const bodyParser = require("body-parser")
const db = require("./connection")
const response = require("./response")

app.use(bodyParser.json())

app.get("/", (req, res) => {
  response(200, "API v1 ready to go", "SUCCESS", res)
})

app.get("/customer", (req, res) => {
  const sql = "SELECT * FROM customer"
  db.query(sql, (err, fields) => {
    if (err) throw err
    response(200, fields, "customer get list", res)
  })
})

app.get("/customer/:user_id", (req, res) => {
  const user_id = req.params.user_id
  const sql = `SELECT * FROM customer WHERE user_id = ${user_id}`
  db.query(sql, (err, fields) => {
    if(err) throw err
    response(200, fields, "get detail customer", res)
  })
})

app.post("/customer", (req, res) => {
  const { user_id, name, email, password, address, nomor_telp } = req.body

  const sql = `INSERT INTO customer (user_id, name, email, password, address, nomor_telp) VALUES (${user_id}, '${name}', '${email}', '${password}', '${address}', '${nomor_telp}')`

  db.query(sql, (err, fields) => {
    if (err) response(500, "invalid", "error", res)
    if (fields?.affectedRows) {
      const data = {
        isSuccess: fields.affectedRows,
        id: fields.insertId,
      }
      response(200, data, "Data Added Successfully", res)
    }
  })
})

app.put("/customer", (req, res) => {
  const { user_id, name, email, password, address, nomor_telp } = req.body
  const sql = `UPDATE customer SET name = '${name}',email =  '${email}',
  password = '${password}',address = '${address}',nomor_telp = '${nomor_telp}' WHERE user_id = ${user_id}`

  db.query(sql, (err,fields) => {
    if (err) response(500, "invalid", "error", res)
      if (fields?.affectedRows) {
        const data = {
          isSuccess: fields.affectedRows,
          message: fields.message,
        }
        response(200, data, "Data updated successfully", res)
      }else{
        response(404, "user not found", "error", res)
      }
  })

})

app.delete("/customer", (req, res) => {
  const { user_id } = req.body
  const sql = `DELETE FROM customer WHERE user_id = ${user_id}`
  db.query(sql, (err, fields) => {
    if (err) response(500, "invalid", "error", res)

    if (fields?.affectedRows)   {
        const data = {
          isDeleted: fields.affectedRows,
        }
        response(200, data, "Deleted Data Successfully", res)
      }else {
        response(404, "user not found", "error", res)
      }
  })
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

