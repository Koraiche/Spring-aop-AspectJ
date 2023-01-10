package ma.emsi.centre.springaspectjaop;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;


@SpringBootApplication
public class SpringAOPApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(SpringAOPApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println("Démarrage de l'application");
	}
}
