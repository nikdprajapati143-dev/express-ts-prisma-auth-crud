import { Router } from 'express';
import { register, login } from '../controllers/auth.controller.js';
import { validateRequest } from '../middlewares/validateRequest.js';
import { registerSchema, loginSchema } from '../validators/authValidator.js';



const router = Router();


router.post('/register', validateRequest(registerSchema), register);
router.post('/login', validateRequest(loginSchema), login);



export default router;
