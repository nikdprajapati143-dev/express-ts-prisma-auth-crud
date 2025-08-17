import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import prisma from '../config/prisma.js';
import dotenv from 'dotenv';
dotenv.config();


export const authMiddleware = async (req: Request, res: Response, next: NextFunction) => {

    const authHeader = req.headers.authorization;
    if (!authHeader) {
        return res.status(401).json({ message: 'No Token provided' });
    }

    const token = authHeader.split(' ')[1];

    try {
        const tokenExist = await prisma.token.findUnique({
            where: {
                token,
                expiresAt: { gt: new Date() }

            }
        });



        if (!tokenExist) {
            return res.status(401).json({ message: 'Invalid or expired token.' });
        }
        jwt.verify(token, process.env.JWT_SECRET as string, (err, decoded) => {
            if (err) {
                return res.status(401).json({ message: 'Unauthorized.' });
            }
            // req.user = decoded;
            (req as any).user = decoded; //  bypasses TypeScript type check
            next();
        });
    } catch (err) {
        return res.status(401).json({ message: 'Token verification failed' });
    }

}

export default authMiddleware;



