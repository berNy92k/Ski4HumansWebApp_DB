package pl.ski4humans.controller.frontend.shoppingCartAndPayment.model;

import pl.ski4humans.entity.Customer;
import pl.ski4humans.entity.ShippingAddress;

public class TransactionData {

    private ShippingAddress shippingAddress;
    private ShoppingCart shoppingCart;
    private Customer customer;

    public TransactionData(ShippingAddress shippingAddress, ShoppingCart shoppingCart, Customer customer) {
        this.shippingAddress = shippingAddress;
        this.shoppingCart = shoppingCart;
        this.customer = customer;
    }

    public ShippingAddress getShippingAddress() {
        return shippingAddress;
    }

    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    public Customer getCustomer() {
        return customer;
    }
}
