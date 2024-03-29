package eShop.service.impl;
import eShop.model.Category;
import eShop.model.Order;
import eShop.model.PaymentRecord;
import eShop.model.user.Role;
import eShop.model.user.Supplier1;
import eShop.model.user.User;
import eShop.repository.PaymentRecordRepository;
import eShop.repository.UserRepository;
import eShop.service.PaymentRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Collections;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;


import static java.util.stream.Collectors.toMap;


@Service
public class PaymentRecordServiceImpl implements PaymentRecordService {
    @Autowired
    private PaymentRecordRepository paymentRecordRepository;
    @Autowired
    private UserRepository userRepository;

    public PaymentRecord savePaymentRecord(Order order){
            PaymentRecord paymentRecord = new PaymentRecord();

            paymentRecord.setOrder(order);
            paymentRecord.setSupplier(order.getCart().getBooks().get(0).getSupplier());
            paymentRecord.setAmount(order.getCart().getTotalPrice());
            paymentRecord.setPaymentDate(LocalDate.now());
            paymentRecord.setBillInfo(order.getCart().getCustomer().getBillingInfos().get(0));
            paymentRecord.setBooks(order.getCart().getBooks());
            paymentRecord.setCustomer(order.getCart().getCustomer());

        return paymentRecordRepository.save(paymentRecord);
    }

    @Override
    public Integer numberOfBooksByCategorySold(Category category) {
        return null;
    }

    @Override
    public Double amountOfSalesBySupplier(User supplier, Integer monthAgo) {
        LocalDate today = LocalDate.now();
        List<PaymentRecord> recentThreeMonthPayment = paymentRecordRepository.
                findAllByPaymentDateBetweenAndSupplier(today.minusMonths(monthAgo + 1).withDayOfMonth(1),
                        today.minusMonths(monthAgo).withDayOfMonth(1), supplier);
        Double amountPerSupplier = 0.0;
        for(PaymentRecord paymentRecord: recentThreeMonthPayment){
            amountPerSupplier += paymentRecord.getAmount();
        }
        return amountPerSupplier;
    }

    @Override
    public LinkedHashMap<User, Double> topSupplierBySales(Integer monthAgo){
        List<User> allSuppliers = userRepository.findAll().stream()
                .filter(s -> s.getRole() == Role.SUPPLIER)
                .collect(Collectors.toList());
        HashMap<User, Double> mapSupplerAndAmount = new HashMap<>();
        for(User supplier: allSuppliers) {
            mapSupplerAndAmount.put(supplier, amountOfSalesBySupplier(supplier, monthAgo));
        }
        LinkedHashMap<User, Double> sortedByValueDesc = mapSupplerAndAmount.entrySet()
                .stream()

                .sorted(Map.Entry.<User, Double>comparingByValue().reversed())

                .collect(toMap(Map.Entry::getKey,
                        Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));


        return sortedByValueDesc;
    }

    @Override
    public Double totalSalesAmount() {
        List<PaymentRecord> allPayment = paymentRecordRepository.findAll();
        Double total = 0.0;
        for(PaymentRecord p: allPayment)
            total += p.getAmount();
        return total;
    }

}
