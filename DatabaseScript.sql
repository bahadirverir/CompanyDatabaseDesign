CREATE SCHEMA `FirmaDB` ;

CREATE TABLE `FirmaDB`.`Çalışanlar` (
  `ÇalışanID` INT NOT NULL AUTO_INCREMENT,
  `Ad` VARCHAR(45) NOT NULL,
  `Soyad` VARCHAR(45) NOT NULL,
  `Yaş` INT NOT NULL,
  `Cinsiyet` VARCHAR(45) NOT NULL,
  `Maş` INT NOT NULL,
  `İletişim` VARCHAR(45) NOT NULL,
  `İkamet Adresi` VARCHAR(45) NOT NULL,
  `Eğitim Derecesi` VARCHAR(45) NOT NULL,
  `Deneyim` INT NOT NULL,
  PRIMARY KEY (`ÇalışanID`));
  
CREATE TABLE `FirmaDB`.`Projeler` (
  `ProjeID` INT NOT NULL,
  `Proje Adı` VARCHAR(45) NOT NULL,
  `Başlangıç Tarihi` VARCHAR(45) NOT NULL,
  `Süre` INT NOT NULL,
  `Durumu` VARCHAR(45) NOT NULL,
  `Bütçe` INT NOT NULL,
  PRIMARY KEY (`ProjeID`));
  
  CREATE TABLE `FirmaDB`.`Ofisler` (
  `OfisID` INT NOT NULL,
  `Lokasyon` VARCHAR(45) NOT NULL,
  `Ofis Durumu` VARCHAR(45) NOT NULL,
  `Faaliyet Zamanı` VARCHAR(45) NOT NULL,
  `Açılış Saati` VARCHAR(45) NOT NULL,
  `Kapanış Saati` VARCHAR(45) NOT NULL,
  `İletişim` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OfisID`));

CREATE TABLE `FirmaDB`.`Departmanlar` (
  `DepartmanID` INT NOT NULL,
  `Departman Adı` VARCHAR(45) NOT NULL,
  `Çalışan Sayısı` INT NOT NULL,
  PRIMARY KEY (`DepartmanID`));
  
  CREATE TABLE `FirmaDB`.`Müşteriler` (
  `MüşteriID` INT NOT NULL,
  `Müşteri Adı` VARCHAR(45) NOT NULL,
  `Müşteri Soyadı` VARCHAR(45) NOT NULL,
  `Müşteri Adresi` VARCHAR(45) NOT NULL,
  `Kart Numarası` INT NOT NULL,
  `Kart Tipi` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MüşteriID`));
  
  CREATE TABLE `FirmaDB`.`Siparişler` (
  `SiparişID` INT NOT NULL,
  `ÜrünID` INT NOT NULL,
  `MüşteriID` INT NOT NULL,
  `Sipariş Tarihi` VARCHAR(45) NOT NULL,
  `Toplam Tutar` INT NOT NULL,
  `Sipariş Durumu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SiparişID`));

CREATE TABLE `FirmaDB`.`Ürünler` (
  `ÜrünID` INT NOT NULL,
  `Ürün Adı` VARCHAR(45) NOT NULL,
  `Garanti Süresi` INT NOT NULL,
  `Garanti Durumu` VARCHAR(45) NOT NULL,
  `Satış Durumu` VARCHAR(45) NOT NULL,
  `Ürün Türü` VARCHAR(45) NOT NULL,
  `Ürün Fiyatı` INT NOT NULL,
  `Satılan Miktar` INT NOT NULL,
  PRIMARY KEY (`ÜrünID`));
  
ALTER TABLE `FirmaDB`.`Çalışanlar` 
ADD COLUMN `DepartmanID` INT NOT NULL AFTER `Deneyim`,
ADD COLUMN `OfisID` INT NOT NULL AFTER `DepartmanID`,
ADD COLUMN `ProjeID` INT NOT NULL AFTER `OfisID`;

ALTER TABLE `FirmaDB`.`Çalışanlar` 
MODIFY COLUMN `ProjeID` INT NULL;

ALTER TABLE `FirmaDB`.`Çalışanlar` 
ADD CONSTRAINT `FK_Çalışanlar_Departman`
  FOREIGN KEY (`DepartmanID`)
  REFERENCES `FirmaDB`.`Departmanlar` (`DepartmanID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_Çalışanlar_Ofis`
  FOREIGN KEY (`OfisID`)
  REFERENCES `FirmaDB`.`Ofisler` (`OfisID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `FK_Çalışanlar_Proje`
  FOREIGN KEY (`ProjeID`)
  REFERENCES `FirmaDB`.`Projeler` (`ProjeID`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

  ALTER TABLE `FirmaDB`.`Siparişler` 
  ADD CONSTRAINT `FK_Siparişler_Müşteriler`
  FOREIGN KEY (`MüşteriID`)
  REFERENCES `FirmaDB`.`Müşteriler` (`MüşteriID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
  CREATE TABLE `FirmaDB`.`Müşteri-Ürün` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `MüşteriID` INT NOT NULL,
  `ÜrünID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Müşteri` FOREIGN KEY (`MüşteriID`) 
  REFERENCES `FirmaDB`.`Müşteriler`(`MüşteriID`) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE,
  CONSTRAINT `FK_Ürün` FOREIGN KEY (`ÜrünID`) 
  REFERENCES `FirmaDB`.`Ürünler`(`ÜrünID`) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE);

CREATE TABLE `FirmaDB`.`Departman-Müşteri` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DepartmanID` INT NOT NULL,
  `MüşteriID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Departman-Müşteri_DepartmanID`
    FOREIGN KEY (`DepartmanID`)
    REFERENCES `FirmaDB`.`Departmanlar` (`DepartmanID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Departman-Müşteri_MüşteriID`
    FOREIGN KEY (`MüşteriID`)
    REFERENCES `FirmaDB`.`Müşteriler` (`MüşteriID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
