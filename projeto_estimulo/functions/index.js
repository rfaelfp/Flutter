
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
const cors = require('cors')({origin: true});
admin.initializeApp();

/**
* Here we're using Gmail to send 
*/
let transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'animaprojetoapp@gmail.com',
        pass: '12345abc,'
    }
});

exports.sendMail = functions.https.onRequest((req, res) => {
    cors(req, res, () => {
      
        // getting dest email by query string
        const dest = req.query.dest;
        const assunto = req.query.assunto;
        const body = req.query.body

        const mailOptions = {
            from: 'Aviso de preenchimento de acompanhamento', // Something like: Jane Doe <janedoe@gmail.com>
            to: dest,
            subject: assunto,
            html: body
        };
  
        // returning result
        return transporter.sendMail(mailOptions, (erro, info) => {
            if(erro){
                return res.send(erro.toString());
            }
            return res.send('Sended');
        });
    });    
});