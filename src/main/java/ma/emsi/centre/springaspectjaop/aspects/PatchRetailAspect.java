package ma.emsi.centre.springaspectjaop.aspects;


import ma.emsi.centre.springaspectjaop.domain.Compte;
import ma.emsi.centre.springaspectjaop.metier.impl.MetierBanqueImpl;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
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
        Compte compte = metierBanque.consulter((Long)proceedingJoinPoint.getArgs()[0]);
        if(compte.getSolde()<(double)proceedingJoinPoint.getArgs()[1]){
            throw new RuntimeException("solde insuffisant");
        }else{
            return proceedingJoinPoint.proceed();
        }

    }
    @AfterThrowing("pc2()")
    public void retirer(){
        System.out.println("an exception has been thrown");
    }
}
