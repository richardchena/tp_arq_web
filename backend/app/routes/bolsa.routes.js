module.exports = app => {
    const bolsa = require("../controllers/bolsa.controller.js");
    var router = require("express").Router();
    router.post("/", bolsa.create);
    router.get("/", bolsa.findAll);
    router.get("/:id", bolsa.findOne);
    router.delete("/:id", bolsa.destroy);
    router.put("/", bolsa.update)
    app.use('/api/v1/bolsa', router);
};