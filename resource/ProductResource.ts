export const productResource = (product: any) => {
    return {
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: product.quantity,
        // description: product.description,
        // image: product.image,
        created_at: product.created_at,
        updated_at: product.updated_at,
    };
};


