import { z } from "zod";


export const createProductSchema = z.object({
    name: z.string().min(3, "Name must be at least 3 characters")
        .max(50, "Name must be at most 50 characters"),
    price: z.number().min(1, "Price must be greater than 0"),
    quantity: z.number().min(1, "Quantity must be greater than 0"),
})


export const updateProductSchema = z.object({
    name: z.string().min(3, "Name must be at least 3 characters")
        .max(50, "Name must be at most 50 characters"),
    price: z.number().min(1, "Price must be greater than 0"),
    quantity: z.number().min(1, "Quantity must be greater than 0"),
})