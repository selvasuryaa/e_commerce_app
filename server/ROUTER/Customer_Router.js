const express = require('express');
const router = express.Router();

router.get("/getcustomerList", (req, res) => {
	customer
		.find()
		.then((data) => {
			console.log('selva',data);
			res.json({ Data:data});
		})
		.catch((err) => {
			res.json({ Error: err });
		});
});

module.exports = router;
