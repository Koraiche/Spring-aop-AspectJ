package ma.emsi.centre.springaspectjaop.service.impl;

import ma.emsi.centre.springaspectjaop.annotations.Log;
import ma.emsi.centre.springaspectjaop.annotations.SecuredByAspect;
import ma.emsi.centre.springaspectjaop.service.IMetier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MetierImpl implements IMetier {
    @Override
    @SecuredByAspect(roles={"USER", "ADMIN"})
    public void process() {
        System.out.println("Business process...");
    }

    @Override
    @Log
    @SecuredByAspect(roles={"ADMIN"})
    public double compute() {
        double data = 78;
        System.out.println("Business computing and returning...");
        return data;
    }
}
