import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import authRoutes from './routes/auth.routes.js';
import productRoutes from './routes/product.routes.js';
import path from 'path';
import { fileURLToPath } from 'url';



dotenv.config();

const port = process.env.PORT || 3000;
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);


const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/assets', express.static(path.join(__dirname, 'assets')));



app.use('/api/auth', authRoutes);
app.use('/api/product', productRoutes);

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
