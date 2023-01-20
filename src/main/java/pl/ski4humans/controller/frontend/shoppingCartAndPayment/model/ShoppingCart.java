package pl.ski4humans.controller.frontend.shoppingCartAndPayment.model;

import pl.ski4humans.entity.Equipment;

import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {

  private final Map<Equipment, Integer> shoppingCart;

  public ShoppingCart() {
    this.shoppingCart = new HashMap<>();
  }

  public void addEquipment(final Equipment equipment) {
    if (shoppingCart.containsKey(equipment)) {
      Integer counter = shoppingCart.get(equipment);
      counter = counter + 1;
      shoppingCart.put(equipment, counter);
    } else {
      shoppingCart.put(equipment, 1);
    }
  }

  public void removeEquipmentByEquipment(final Equipment equipment) {
    shoppingCart.remove(equipment);
  }

  public void removeEquipmentById(final int id) {
    for (final Map.Entry<Equipment, Integer> equipmentIntegerEntry : shoppingCart.entrySet()) {
      if (equipmentIntegerEntry.getKey().getEquipmentId() == id) {
        shoppingCart.remove(equipmentIntegerEntry.getKey());
        break;
      }
    }
  }

  public int getTotalQuantity() {
    int sumQuantity = 0;
    for (final Map.Entry<Equipment, Integer> equipments : shoppingCart.entrySet()) {
      sumQuantity = sumQuantity + equipments.getValue();
    }
    return sumQuantity;
  }

  public float getTotalAmount() {
    float sumAmount = 0;
    for (final Map.Entry<Equipment, Integer> equipments : shoppingCart.entrySet()) {
      sumAmount = sumAmount + equipments.getValue() * equipments.getKey().getPrice();
    }
    return sumAmount;
  }

  public void updateShoppingCart(final Map<Integer, Integer> eqIdAndQuantity) {
    for (final Map.Entry<Integer, Integer> integerIntegerEntry : eqIdAndQuantity.entrySet()) {
      final Equipment key = new Equipment();
      key.setEquipmentId(integerIntegerEntry.getKey());

      final Integer value = integerIntegerEntry.getValue();

      shoppingCart.put(key, value);
    }
  }

  public int getTotalQuantityOfEquipments() {
    return shoppingCart.size();
  }

  public void clearShoppingCart() {
    shoppingCart.clear();
  }

  public Map<Equipment, Integer> getShoppingCart() {
    return shoppingCart;
  }
}
