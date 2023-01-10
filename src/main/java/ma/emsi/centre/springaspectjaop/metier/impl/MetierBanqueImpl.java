package ma.emsi.centre.springaspectjaop.metier.impl;

import ma.emsi.centre.springaspectjaop.domain.Compte;
import ma.emsi.centre.springaspectjaop.metier.IMetierBanque;

import java.util.HashMap;
import java.util.Map;

public class MetierBanqueImpl implements IMetierBanque {
    private Map<Long, Compte> compteMap= new HashMap<>();
    @Override
    public void addCommpte(Compte cp) {
        this.compteMap.put(cp.getCode(), cp);
    }

    @Override
    public void verser(Long code, double montant) {
        Compte compte = this.compteMap.get(code);
        compte.setSolde(compte.getSolde()+montant);
    }

    @Override
    public void retirer(Long code, double montant) {
        Compte compte = this.compteMap.get(code);
        compte.setSolde(compte.getSolde()-montant);
    }

    @Override
    public Compte consulter(Long code) {
        return this.compteMap.get(code);
    }
}
