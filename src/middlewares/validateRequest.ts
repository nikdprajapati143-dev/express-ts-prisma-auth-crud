import { Request, Response, NextFunction } from "express";
import { z, ZodTypeAny } from "zod";

export const validateRequest = (schema: ZodTypeAny) => {
    return (req: Request, res: Response, next: NextFunction) => {
        const result = schema.safeParse(req.body);
        if (!result.success) {
            return res.status(400).json({
                status: false,
                errors: result.error.issues.map(err => ({
                    field: err.path.join("."),
                    message: err.message
                }))
            });
        }
        next();
    };
};