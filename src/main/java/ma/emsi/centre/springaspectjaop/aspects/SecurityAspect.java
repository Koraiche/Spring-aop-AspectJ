package ma.emsi.centre.springaspectjaop.aspects;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.Scanner;

@Aspect
@Component
public class SecurityAspect {

    @Pointcut("execution(* ma.emsi.centre.springaspectjaop.*.run(..))")
    public void startApplication(){}

    @Around("startApplication()")
    public void beforeStart(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        boolean connected = false;
        Scanner scanner = new Scanner(System.in);
        while(!connected) {
            System.out.println("Username : ");
            String username = scanner.next();
            System.out.println("Password : ");
            String pwd = scanner.next();
            if (username.equals("root") && pwd.equals("root")) {
                connected = true;
                proceedingJoinPoint.proceed();
            }
        }
    }
}
