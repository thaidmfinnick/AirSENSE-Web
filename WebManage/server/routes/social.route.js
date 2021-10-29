const express = require('express');
const  socialCtrl = require('../controllers/social.controller.js');
const  iotCtrl = require('../controllers/iot.controller.js');


const isAuthenticated = require('../middlewares/authenticate.js');
const validate = require('../config/joi.validate.js');
const schema = require('../utils/validator.js');

const router = express.Router();

router.route('/check_email').post((req, res) => {
  socialCtrl.checkEmailRegister(req, res);
})
router.route('/gethome').get(socialCtrl.gethome);
router.route('/mainPages').post(socialCtrl.gethome);
router.route('/userdetail').post(socialCtrl.gethome);
router.route('/getThreshold').get(iotCtrl.getThreshhold);
router.route('/getdata').post(iotCtrl.reportDataSensor);

router.route('/getStation').get(isAuthenticated,iotCtrl.getStationServer);
router.route('/getStationHome').get(iotCtrl.getStationHome);
router.route('/getdatalimit').post(isAuthenticated,iotCtrl.reportDataStationLimit);
router.route('/getReportStations').post(isAuthenticated,iotCtrl.getReportStations);
router.route('/getAbnormalData').post(iotCtrl.getAbnormalData);


router.route('/getTotalPosts').get(socialCtrl.getTotalPosts);
router.route('/getBlogsPagination').get(socialCtrl.getPostsPagination);
router.route('/getPosts').get(socialCtrl.getPosts);
router.route('/savePost').post(socialCtrl.savePost);


router.route('/getCurrentAQI').get(iotCtrl.getCurrentAQI);
router.route('/getAqiData').post(iotCtrl.getAqiData);//get aqi in recent 24h
router.route('/getDataRecent').post(iotCtrl.getDataRecent);






module.exports =  router;
