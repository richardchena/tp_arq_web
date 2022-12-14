module.exports = app => {
    const bolsa = require("../controllers/bolsa.controller.js");
    var router = require("express").Router();
    router.post("/", bolsa.create);
    router.get("/", bolsa.findAll);
    router.get("/:id", bolsa.findOne);
    router.delete("/:id", bolsa.destroy);
    router.put("/", bolsa.update);
    router.put("/bolsas/", bolsa.updateBolsas);
    router.get("/bolsas/:id/:monto", bolsa.get_bolsas);
    router.get("/saldo/:id/:monto", bolsa.saldo_disponible);
    router.get("/dias/:dias", bolsa.dias_vencer);
    
    app.use('/api/v1/bolsa', router);
};