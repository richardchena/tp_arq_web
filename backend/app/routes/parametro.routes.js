module.exports = app => {
    const parametro = require("../controllers/parametro.controller.js");
    var router = require("express").Router();
    router.post("/", parametro.create);
    router.get("/", parametro.findAll);
    router.get("/:id", parametro.findOne);
    router.delete("/:id", parametro.destroy);
    router.put("/", parametro.update);
    app.use('/api/v1/parametro', router);
};