# Usage

Once the application is running, open your browser to `http://localhost:3000`.

## Storefront

### Browse Products

- The home page displays a grid of products, organized by category.
- Click any product to view its detail page, showing name, description, price, image, and stock availability.

### Shopping Cart

- On a product detail page, click **Add to Cart** to place the item in your session-based cart.
- Access your cart anytime via the navigation link (e.g., `/cart`). The cart page lists items, quantities, and allows removal.

### Checkout

- From the cart, proceed to checkout at `/orders/new`. Fill in your contact and shipping details, then submit the form.
- After successful submission, you'll see an order confirmation page (`/orders/:id`) with your order summary and line items.

## Admin Panel

- Navigate to `/admin/login` to access the admin login page.
- Enter the admin credentials (see seeds or create via console).
- Once logged in, you'll be directed to the admin products list.

### Managing Products

- **List** all products (`/admin/products`). Click a product name to edit.
- **Create** a new product by clicking "New Product" and filling the form (name, description, price, image URL, stock, category).
- **Edit** a product: update fields and save.
- **Delete** a product: click the delete button on the list.

## API / Manual Requests (optional)

If you prefer to interact programmatically, here are the key endpoints:

```bash
# List products
curl http://localhost:3000/products

# View a product (replace 1 with id)
curl http://localhost:3000/products/1

# Add to cart (POST request, may require CSRF token)
curl -X POST http://localhost:3000/cart/add -d "product_id=1"

# View cart
curl http://localhost:3000/cart

# Checkout form
curl http://localhost:3000/orders/new
```

**Note**: The application uses session-based CSRF protection; to use curl effectively, you may need to pass cookies and tokens. For full interaction, use a browser.