#!/usr/bin/perl

use Biblio::Thesaurus;
use Data::Dumper;

$obj = thesaurusNew();

$obj->addTerm('city');
$obj->addTerm('country');

$obj->addTerm('Lisboa');
$obj->addRelation('Lisboa','is-a','city');
$obj->addRelation('Lisboa','lat','38.7385758');
$obj->addRelation('Lisboa','lng','-9.1657589');
$obj->addTerm('Braga');
$obj->addRelation('Braga','is-a','city');
$obj->addRelation('Braga','lat','41.5517605');
$obj->addRelation('Braga','lng','-8.4229034');
$obj->addTerm('Guimaraes');
$obj->addRelation('Guimaraes','is-a','city');
$obj->addRelation('Guimaraes','lat','41.4419546');
$obj->addRelation('Guimaraes','lng','-8.2956069');
$obj->addTerm('Porto');
$obj->addRelation('Porto','is-a','city');
$obj->addTerm('Bruxelas');
$obj->addRelation('Bruxelas','is-a','city');
$obj->addTerm('Madrid');
$obj->addRelation('Madrid','is-a','city');
$obj->addRelation('Madrid','lat','40.4167413');
$obj->addRelation('Madrid','lng','-3.7032498');
$obj->addTerm('Vigo');
$obj->addRelation('Vigo','is-a','city');
$obj->addRelation('Vigo','lat','42.2313564');
$obj->addRelation('Vigo','lng','-8.7124471');
$obj->addTerm('Londres');
$obj->addRelation('Londres','is-a','city');
$obj->addTerm('Paris');
$obj->addRelation('Paris','is-a','city');

$obj->addTerm('Portugal');
$obj->addRelation('Portugal','is-a','country');
$obj->addRelation('Portugal','lat','39.399872');
$obj->addRelation('Portugal','lng','-8.224454');
$obj->addTerm('Belgica');
$obj->addRelation('Belgica','is-a','country');
$obj->addTerm('Spain');
$obj->addRelation('Spain','is-a','country');
$obj->addRelation('Spain','lat','39.7240885');
$obj->addRelation('Spain','lng','-3.84521');
$obj->addTerm('Franca');
$obj->addRelation('Franca','is-a','country');
$obj->addTerm('Inglaterra');
$obj->addRelation('Inglaterra','is-a','country');

$obj->addTerm('Europa');

$obj->addRelation('Lisboa','city-of','Portugal');
$obj->addRelation('Braga','city-of','Portugal');
$obj->addRelation('Guimaraes','city-of','Portugal');
$obj->addRelation('Porto','city-of','Portugal');
$obj->addRelation('Bruxelas','city-of','Belgica');
$obj->addRelation('Madrid','city-of','Spain');
$obj->addRelation('Vigo','city-of','Spain');
$obj->addRelation('Londres','city-of','Inglaterra');
$obj->addRelation('Paris','city-of','Franca');

$obj->addRelation('Lisboa','capital-of','Portugal');
$obj->addRelation('Paris','capital-of','Franca');
$obj->addRelation('Bruxelas','capital-of','Belgica');
$obj->addRelation('Madrid','capital-of','Spain');
$obj->addRelation('Londres','capital-of','Inglaterra');

$obj->addRelation('Portugal','country-of','Europa');
$obj->addRelation('Belgica','country-of','Europa');
$obj->addRelation('Spain','country-of','Europa');
$obj->addRelation('Franca','country-of','Europa');
$obj->addRelation('Inglaterra','country-of','Europa');

$obj->addTerm('Castelo de Alva');
$obj->addRelation('Castelo de Alva','is-a','castle');
$obj->addRelation('Castelo de Alva','lat','41.0913745');
$obj->addRelation('Castelo de Alva','lng','-6.8078773');

$obj->addTerm('Castelo de Tavira');
$obj->addRelation('Castelo de Tavira','is-a','castle');
$obj->addRelation('Castelo de Tavira','lat','37.1213122');
$obj->addRelation('Castelo de Tavira','lng','-7.6533538');

$obj->addTerm('Museu Académico');
$obj->addRelation('Museu Académico','is-a','museum');
$obj->addRelation('Museu Académico','lat','40.208213');
$obj->addRelation('Museu Académico','lng','-8.4229323');

#$obj->complete;
$obj->save('ontomap.iso');

