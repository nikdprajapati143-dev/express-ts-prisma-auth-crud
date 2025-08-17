import { Request, Response } from "express";
import prisma from "../config/prisma.js";
import { productResource } from "../../resource/ProductResource.js";

export const createProduct = async (req: Request, res: Response) => {
    // try {
    const { name, price, quantity } = req.body;
    // console.log(name, price, quantity);
    const product = await prisma.product.create({
        data: {
            name,
            price: Number(price),
            quantity: Number(quantity)
        }
    })

    res.status(200).send({
        status: true,
        message: 'Product created successfully',
        data: productResource(product)
    });

    // } catch (err) {
    //     res.status(500).json({ message: "Internal Server Error" });
    // }
}

export const getAllProducts = async (req: Request, res: Response) => {
    try {
        const products = await prisma.product.findMany();

        if (products.length === 0) {
            return res.status(404).send({
                status: false,
                message: 'No products found'
            })
        }

        res.status(200).send({
            status: true,
            message: 'Products fetched successfully',
            data: products.map((product: any) => productResource(product))
        })

    } catch (err) {
        res.status(500).json({ message: "Internal Server Error" });
    }
}


export const getProductById = async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const product = await prisma.product.findUnique({
            where: {
                id: Number(id)
            }
        });

        if (!product) {
            return res.status(404).send({
                status: false,
                message: 'Product not found'
            })
        }

        res.status(200).send({
            status: true,
            message: 'Product fetched successfully',
            data: productResource(product)
        })
    } catch (err) {
        res.status(500).json({ message: "Internal Server Error" });
    }
}

export const updateProduct = async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const { name, price, quantity } = req.body;
        const product = await prisma.product.update({
            where: {
                id: Number(id)
            },
            data: {
                name,
                price: Number(price),
                quantity: Number(quantity)
            }
        })


        res.status(200).send({
            status: true,
            message: 'Product updated successfully',
            data: productResource(product)
        })

    } catch (err) {
        res.status(500).json({
            message: "Internal Server Error"
        })
    }
}


export const deleteProduct = async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const product = await prisma.product.delete({
            where: {
                id: Number(id)
            }
        })

        res.status(200).send({
            status: true,
            message: "Product deleted successfully",
            data: productResource(product)
        })
    }
    catch (err) {
        res.status(500).json({
            message: "Internal Server Error"
        })
    }
}

