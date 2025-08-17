import { Router } from 'express';
import { createProduct, getAllProducts, getProductById, updateProduct, deleteProduct } from '../controllers/product.controller.js';
import { authMiddleware } from '../middlewares/auth.middleware.js';
import { validateRequest } from '../middlewares/validateRequest.js';
import { createProductSchema, updateProductSchema } from '../validators/prooductValidator.js';
const router = Router();


router.post('/create', authMiddleware, validateRequest(createProductSchema), createProduct);
router.get('/getAllProducts', authMiddleware, getAllProducts);
router.get('/:id', authMiddleware, getProductById);
router.put('/update/:id', authMiddleware, validateRequest(updateProductSchema), updateProduct);
router.delete('/delete/:id', authMiddleware, deleteProduct);


export default router;
