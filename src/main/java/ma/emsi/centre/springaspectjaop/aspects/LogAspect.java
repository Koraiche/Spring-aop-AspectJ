package ma.emsi.centre.springaspectjaop.aspects;


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
public class LogAspect{

    Logger log = LoggerFactory.getLogger(this.getClass());

    @Pointcut("@annotation(ma.emsi.centre.springaspectjaop.annotations.Log)")
    public void logAnnotated(){

    }
    @Around("logAnnotated()")
    public Object beforeProcess(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        long t1 = System.currentTimeMillis();
        log.info("From loggind aspects ... Before " + proceedingJoinPoint.getSignature());
        Object obj = proceedingJoinPoint.proceed();
        long t2 = System.currentTimeMillis();
        log.info("From loggind aspects ... After " + proceedingJoinPoint.getSignature());
        log.info("Duration : " + (t2-t1));
        log.warn("Duration : " + (t2-t1));
        return obj;
    }
}
