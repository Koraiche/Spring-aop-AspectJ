package ma.emsi.centre.springaspectjaop.aspects;


import ma.emsi.centre.springaspectjaop.domain.Compte;
import ma.emsi.centre.springaspectjaop.metier.impl.MetierBanqueImpl;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class PatchRetailAspect {

    Logger log = LoggerFactory.getLogger(PatchRetailAspect.class);
    @Pointcut("execution(* ma.emsi.centre.springaspectjaop.metier.impl.MetierBanqueImpl.retirer(..))")
    public void pc2(){

    }
    @Around("pc2()")
    public Object autour(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        MetierBanqueImpl metierBanque = (MetierBanqueImpl)proceedingJoinPoint.getTarget();
        metierBanque.consulter((Long)proceedingJoinPoint.getArgs()[0]);
        return proceedingJoinPoint.proceed();
    }
}
