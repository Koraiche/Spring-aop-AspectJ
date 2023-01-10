package ma.emsi.centre.springaspectjaop;

import ma.emsi.centre.springaspectjaop.domain.Compte;
import ma.emsi.centre.springaspectjaop.metier.IMetierBanque;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;


@SpringBootApplication
@EnableAspectJAutoProxy
@ComponentScan("ma.emsi.centre.springaspectjaop")
public class SpringAOPApplication implements CommandLineRunner {

	@Autowired
	private IMetierBanque metierBanque;

	public static void main(String[] args) {
		SpringApplication.run(SpringAOPApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println("Démarrage de l'application");
		this.metierBanque.addCommpte(new Compte(0l,100));
	}
}
