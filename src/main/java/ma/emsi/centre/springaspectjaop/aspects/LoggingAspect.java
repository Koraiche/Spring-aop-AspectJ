package ma.emsi.centre.springaspectjaop.aspects;


import ma.emsi.centre.springaspectjaop.domain.Compte;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
    long t1, t2;
    Logger log = LoggerFactory.getLogger(LoggingAspect.class);
    @Pointcut("execution(* ma.emsi.centre.springaspectjaop.metier.impl.*.*(..))")
    public void pc1(){

    }
    @Around("pc1()")
    public void avant(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

        log.info("Before executing : \nwith signature : "+ proceedingJoinPoint.getSignature() +
                "\nwith args : " + (Compte)proceedingJoinPoint.getArgs()[0]+
                "\nwith kind : " + proceedingJoinPoint.getKind()+
                "\nwith target : " + proceedingJoinPoint.getTarget()+
                "\nwith this : " + proceedingJoinPoint.getThis()+
                "\nwith source location : " + proceedingJoinPoint.getSourceLocation()+
                "\nwith static part : " + proceedingJoinPoint.getStaticPart()+
                "\nwith class : " + proceedingJoinPoint.getClass());
        t1 = System.currentTimeMillis();
        proceedingJoinPoint.proceed();
        t2 = System.currentTimeMillis();
        log.info("after pc1, executed for :" + (t2-t1) + "milliseconds");
    }
}
