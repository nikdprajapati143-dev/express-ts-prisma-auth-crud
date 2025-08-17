import { Request, Response } from "express";
import PrismaClient from "@prisma/client";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import prisma from "../config/prisma.js";
import { UserResource } from "../../resource/UserResource.js";

const JWT_SECRET = process.env.JWT_SECRET as string;

export const register = async (req: Request, res: Response) => {
    try {
        const { name, email, password } = req.body;
        const existingUser = await prisma.user.findUnique({
            where: { email }
        });
        if (existingUser) {
            return res.status(400).send({
                status: false,
                message: "Email already exists"
            });
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const user = await prisma.user.create({
            data: {
                name,
                email,
                password: hashedPassword
            }
        })

        res.status(201).send({
            status: true,
            message: "User Registered Successfully",
            data: UserResource(user)
        })

    } catch {

    }
};


export const login = async (req: Request, res: Response) => {
    try {
        const { email, password } = req.body;
        const user = await prisma.user.findUnique({
            where: { email }
        })
        if (!user) {
            return res.status(400).send({
                status: false,
                message: "User not found.Please try again."
            })
        }

        const isPasswordValid = await bcrypt.compare(password, user.password);
        if (!isPasswordValid) {
            return res.status(401).send({
                status: false,
                message: "Invalid credentials"
            })
        }

        const token = jwt.sign({ userId: user.id }, JWT_SECRET, { expiresIn: "1h" });
        const expiresAt = new Date(Date.now() + 60 * 60 * 1000); // 1 hour from now
        await prisma.token.create({
            data: {
                token,
                expiresAt: expiresAt,
                createdAt: new Date(),
                userId: user.id
            }
        })

        res.status(200).send({
            status: true,
            message: "Login Successfull",
            data: {
                token,
                user: UserResource(user)
            }
        })


    } catch (error) {
        console.log(error);
        res.status(500).send({
            status: false,
            message: "Internal Server Error"
        })
    }
}





