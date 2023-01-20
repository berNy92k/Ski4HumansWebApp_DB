package pl.ski4humans.controller.frontend.shoppingCartAndPayment.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import pl.ski4humans.entity.Customer;
import pl.ski4humans.entity.ShippingAddress;

@Getter
@AllArgsConstructor
public class TransactionData {

  private final ShippingAddress shippingAddress;
  private final ShoppingCart shoppingCart;
  private final Customer customer;
}
