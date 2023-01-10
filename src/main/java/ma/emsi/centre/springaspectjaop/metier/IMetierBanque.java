package ma.emsi.centre.springaspectjaop.metier;


import ma.emsi.centre.springaspectjaop.domain.Compte;

public interface IMetierBanque {
    void addCommpte(Compte cp);
    void verser(Long code, double montant);
    void retirer(Long code, double montant);
    Compte consulter(Long code);
}
