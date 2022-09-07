-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 07 sep. 2022 à 22:53
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_ebook`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `id_auteur` int(11) NOT NULL,
  `nom_auteur` varchar(60) NOT NULL,
  `prenom_auteur` varchar(60) NOT NULL,
  `pays_auteur` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id_auteur`, `nom_auteur`, `prenom_auteur`, `pays_auteur`) VALUES
(1, 'Simon and Schuster ', 'Simon and Schuster ', 'usa');

-- --------------------------------------------------------

--
-- Structure de la table `catigorie`
--

CREATE TABLE `catigorie` (
  `id_catigorie` int(11) NOT NULL,
  `nom_catigorie` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `catigorie`
--

INSERT INTO `catigorie` (`id_catigorie`, `nom_catigorie`) VALUES
(1, 'programation');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `code_client` int(11) NOT NULL,
  `nom_client` varchar(60) NOT NULL,
  `prenom_client` varchar(60) NOT NULL,
  `ville_client` varchar(60) NOT NULL,
  `pays_client` varchar(60) NOT NULL,
  `tel_client` varchar(60) NOT NULL,
  `adresse_client` varchar(60) NOT NULL,
  `emaile_client` varchar(60) NOT NULL,
  `motpasse_client` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `ref_cmd` int(11) NOT NULL,
  `date_cmd` date NOT NULL,
  `adresse_livraison` varchar(60) NOT NULL,
  `prix` float NOT NULL,
  `quantité_cmd` int(11) NOT NULL,
  `code_client` int(11) NOT NULL,
  `id_pannier` int(11) NOT NULL,
  `Num_livraison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE `editeur` (
  `id_editeur` int(11) NOT NULL,
  `nom_editeur` varchar(60) NOT NULL,
  `pays_editeur` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `editeur`
--

INSERT INTO `editeur` (`id_editeur`, `nom_editeur`, `pays_editeur`) VALUES
(1, 'Ryle Kincaid,', 'usa');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_pannier`
--

CREATE TABLE `ligne_pannier` (
  `quantite_ligne` int(11) NOT NULL,
  `prixUnitaire_ligne` float NOT NULL,
  `prixtotal_ligne` float NOT NULL,
  `id_pannier` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `Num_livraison` int(11) NOT NULL,
  `date_livraison` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id_livre` int(11) NOT NULL,
  `nom_livre` varchar(60) NOT NULL,
  `editeur_livre` varchar(60) NOT NULL,
  `ISBN_livre` varchar(60) NOT NULL,
  `prix_livre` float NOT NULL,
  `quantité_stock` int(11) NOT NULL,
  `image_livre` varchar(60) NOT NULL,
  `resume_livre` longtext NOT NULL,
  `discipline` varchar(200) NOT NULL,
  `théme` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id_livre`, `nom_livre`, `editeur_livre`, `ISBN_livre`, `prix_livre`, `quantité_stock`, `image_livre`, `resume_livre`, `discipline`, `théme`) VALUES
(0, 'Sept nouvelles de la Terre', 'MAGNARD', '978-2210772526', 90, 50, 'b1.jpg', 'Les nouvelles de ce recueil offrent toutes une vision de notre monde soumis aux changements que le climat et les hommes lui imposent depuis des décennies. Réalistes, fantastiques ou de science-fiction, ces textes donnent à réfléchir sur notre rôle de terrien, sur la place de l’homme dans l’univers et son rapport au monde. Les interrogations, inquiétudes et espoirs des grands auteurs de ce recueil rejoignent ceux de l’humanité entière en matière d’environnement.', ' Français', '2022'),
(1, 'It Ends With Us', 'Ryle Kincaid,', '151515515', 150, 55, 'itus.jpg', 'Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town in Maine where she grew up — she graduated from college, moved to Boston, and started her own business. So when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life suddenly seems almost too good to be true.', 'english', '2022'),
(2, 'Apprendre à programmer ', 'Dunod', '2100783599', 220, 10, 'b2.jpeg', 'La programmation vous paraît inaccessible  ? Les lignes de code vous font peur  ? Mais vous avez envie d’apprendre à programmer alors que vous n’avez aucune connaissance en informatique  ? Ce livre est fait pour vous  !\r\nGrâce à Blockly, un environnement visuel et simple d’utilisation, maîtrisez enfin les bases de la programmation en 10 semaines chrono  !', 'Français', '2019'),
(3, 'وحي القلم', 'مصطفى صادق الرافعي', 'B078H1959R', 59, 20, 'b3.jpg', '\"جاء في تاريخ الواقدي «أن «المُقَوْقِسَ» عظيم القبط في مصر، زوَّج بنته «أرمانوسة» من «قسطنطين بن هرقل» وجهَّزها بأموالها حشمًا لتسير إليه، حتى يبني بها١ في مدينة قَيْسارِيَة؛٢ فخرجت إلى بُلْبَيْسَ٣ وأقامت بها … وجاء عمرو بن العاص إلى بلبيس فحاصرها حصارًا شديدًا، وقاتل من بها، وقتل منهم زهاء ألف فارس، وانهزم من بقي إلى المقوقس، وأُخِذَتْ أرمانوسةُ وجميعُ مالِها، وأُخذ كلُّ ما كان للقبط في بلبيس. فأحب عمرو ملاطفة المقوقس، فسيَّرَ إليه ابنته مكرَّمة في جميع مالها، «مع قيس بن أبي العاص السهمي»؛ فسُرَّ بقدومها …»\r\n•••هذا ما أثبته الواقدي في روايته، ولم يكن معنيًّا إلا بأخبار المغازي والفتوح، فكان يقتصر عليها في الرواية؛ أما ما أغفله فهو ', 'Arabic', '2017'),
(4, 'Clean Code', 'Pearson', '978-0132350884 Edition', 254, 50, 'b4.jpg', 'Even bad code can function. But if code isn’t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn’t have to be that way.\r\n\r\nNoted software expert Robert C. Martin presents a revolutionary paradigm with Clean Code: A Handbook of Agile Software Craftsmanship. Martin has teamed up with his colleagues from Object Mentor to distill their best agile practice of cleaning code “on the fly” into a book that will instill within you the values of a software craftsman and make you a better programmer–but only if you work at it.\r\n', 'English', '2008'),
(5, 'Mangroves with Therapeutic', ' Sadeer Nabeelah Bibi, Mahomoodally M. Fawzi', '656516', 120, 5313, 'b5.jpg', 'Mangroves with Therapeutic Potential for Human Health: Global Distribution, Ethnopharmacology, Phytochemistry, and Biopharmaceutical Applications explores for the first time in a book the exciting potential of mangroves for therapeutic applications in medicine and pharmacology. Mangroves are halophytes popularly known for their ecological importance but rarely acknowledged for their medicinal properties. This authoritative, illustrated and clearly written book pairs the fascinating biodiversity of mangroves with their promising pharmacological propensities. Providing a comprehensive and authoritative overview, the book explores the important aspects related to mangroves including global distribution, medicinal values and pharmaceutical applications in one source.', ' English', '2022'),
(6, 'Code (2nd Ed.)', 'Petzold Charles', 's156456c', 85, 56, '1317908347.jpg', 'The classic guide to how computers work, updated with new chapters and interactive graphics\n\n\"For me, Code was a revelation. It was the first book about programming that spoke to me. It started with a story, and it built up, layer by layer, analogy by analogy, until I understood not just the Code, but the System. Code is a book that is as much about Systems Thinking and abstractions as it is about code and programming. Code teaches us how many unseen layers there are between the computer systems that we as users look at every day and the magical silicon rocks that we infused with lightning and taught to think.\"', 'English', '2022'),
(7, 'Learn to Program with Assembly', 'Jonathan Bartlett', '4545vcx', 250, 7, '1317728697.jpg', 'Learn to program using the Assembly programming language and master the most important concepts in programming. Taking your first steps in programming with the Assembly language will make learning higher level programming languages that much easier.\n\nMost beginning-level programming books attempt to shield you from how your computer really works. Instead, author Jonathan Bartlett starts by teaching how the computer works under the hood 32-bit x86, 64-bit x86 and Arm, so that you will have a sufficient background to be successful in all areas of programming.  \n\nNext, you\'ll see and write your very first programs, followed by a deep dive into functions, files, simple records, read/write, and more. After this, you?ll start coding robust applications and sharing functions with code libraries. Practical examples help illustrate each topic, and full source code is available for download from the Apress website.', 'English', '2022\n'),
(8, '	\nفاتتنى صلاة', '	اسلام جمال', 'ercxvc', 52, 42, '244799.jpg', ' نسمع شيخاً يتحدث عن الصلاة و أهميتها و عقوبة وعقوبة تاركها فنذهب لنصلي فنجد ان الصلاة ثقيلة فنتركها ظننا ان من يأمرنا بها لايشعر بما نشعر به ظننا ان من يحافظ عليها لديه هبة إلهية ليست عندنا انتظرنا تلك الهبة طويلاً ،حتي فاتتنا صلاة بعد الصلاة لاننا لم نحل اصل المشكلة وهو لماذا تبدو الصلاة ثقيلة.\n\nملخص فاتتني صلاة\nيتسائل اسلام جمال لماذا البعض يحافظ على الصلاة بينما يتركها الكثيرين ؟ فقسم لنا الكاتب الكتاب إلى عدة فصول للتعرف على أسرار هؤلاء الذين قلما فاتتهم صلاة .', 'arabic', '2019'),
(9, '	\nصاحب الظل الطويل', 'جين ويبستر', '52', 76, 7, 'download.jpg', 'صاحب الظل الطويل أو أبي طويل الساقين، هي رواية للكاتبة الأمريكية جين ويبستر. تدور أحداث القصة حول فتاة يتيمة اسمها جودي أبوت، التي تحصل على منحة للدراسة في مدرسة لينكولن الثانوية من قبل شخص لا تعرفه، اسمه المستعار هو جون سميث وقد ابتكرت له اسم \"صاحب الظل الطويل\" فهي لم تستطع أن تراه وتشكره، فقط رأت ظله الطويل. المقابل الوحيد الذي اشترطه سميث على جودي مقابل المنحة هو أن تقوم بمراسلته مرة واحدة كل شهر، بدون أن تتوقع رداً منه على رسائلها بالضرورة.', 'arabic', '2020'),
(10, '	\nPHP', '	يوسف صالح الجرعي', 'scds45', 76, 42, 'ba6f8e0.png', 'اول كتاب عربي متكامل يشرح تصميم المواقع الالكترونية ويتناول جميع المتطلبات من لغات وبرمجة واستضافة ورفع للموقع الالكتروني ومرفق جميع التطبيقات التي تم تطبيقها وشرحها خطوة بخطوة وانشاء مواقع الكترونية من الصفر.', 'arabic', '2020'),
(11, 'EL-HOUDA DICTIONNAIRE FRANÇAIS-FRANÇAIS', 'Hayet Nekaa', 'ghgfh', 52, 7, '15007-diction-El-houda-Fr-Fr.jpg', 'Edition vue et corrigée par le Dr Mohamed Salah Chehad, maître de conférence en science du langage à l\'université Mentouri - Constantine (Constantine).\n', 'francais', '2018'),
(12, ' Mémoires d\'Abd-el-Krim', ' Abd-el-Krim', 'erhuk456', 180, 42, 'Mel.png', '\nMYomoires d\'Abd-el-Krim\n\nActeur essentiel de l\'anticolonialisme, l\'émir Abd-el-Krim livra ses mémoires au journaliste Jacques Roger-Mathieu avant son exil à La Réunion. L\'entretien entre les deux protagonistes est un véritable trésor du patrimoine, publié à compte d\'auteur et tiré, à l\'époque, à seulement trente-cinq exemplaires. Ne cachant pas son soutien à la France, le journaliste questionna sans fausse pudeur l\'émir, qui, en fin diplomate, donna des réponses tintées d\'une grande sagesse.', 'francais', '2008'),
(13, ' Apprendre a dialoguer', ' Dr \'Abd al-Karîm Bakkâr', 'bhnj4545', 86, 7, '38026-apprendre-a-dialoguer-au-sein-de-la-famille-1.jpg', '\nApprendre a dialoguer\n\nLe dialogue est à la base de toute interaction sociale. En effet, il est le ciment qui crée la cohésion, mais celle-ci ne sera forte que si tous les ingrédients nécessaires sont présents.\n\nÀ l’heure de la mondialisation et des réseaux sociaux, il est facile d’échanger avec le monde entier, mais on observe dans un même temps que le dialogue au sein du foyer se détériore, et ce, de façon généralisée. Cela s’observe dans les relations parents-enfants, mais aussi dans les relations que les enfants ont entre eux, jusque dans celles qui touchent le couple.', 'francais', '2014'),
(14, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f'),
(15, 'ZAX', 'X', 'X', 0, 7, 'x', 'x', 'x', 'x'),
(16, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f'),
(17, 'ZAX', 'X', 'X', 0, 7, 'x', 'x', 'x', 'x'),
(18, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f'),
(19, 'ZAX', 'X', 'X', 0, 7, 'x', 'x', 'x', 'x'),
(20, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f'),
(21, 'ZAX', 'X', 'X', 0, 7, 'x', 'x', 'x', 'x'),
(22, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f'),
(23, 'ZAX', 'X', 'X', 0, 7, 'x', 'x', 'x', 'x'),
(24, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f'),
(25, 'ZAX', 'X', 'X', 0, 7, 'x', 'x', 'x', 'x'),
(26, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f'),
(27, 'ZAX', 'X', 'X', 0, 7, 'x', 'x', 'x', 'x'),
(28, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f'),
(29, 'ZAX', 'X', 'X', 0, 7, 'x', 'x', 'x', 'x'),
(30, 'esrf', 'er', 'er', 0, 42, 'ewr', 'ewr', 'f', 'f');

-- --------------------------------------------------------

--
-- Structure de la table `pannier`
--

CREATE TABLE `pannier` (
  `id_pannier` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL,
  `nom_pannier` varchar(60) NOT NULL,
  `prix` float NOT NULL,
  `etat_pannier` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pannier`
--

INSERT INTO `pannier` (`id_pannier`, `id_livre`, `nom_pannier`, `prix`, `etat_pannier`) VALUES
(1, 0, 'aaa', 0, 'en Cours'),
(3, 1, 'It Ends With Us', 150, 'en Cours'),
(4, 5, 'Mangroves with Therapeutic', 120, 'en Cours'),
(5, 6, 'Code (2nd Ed.)', 85, 'en Cours');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `login` varchar(60) NOT NULL,
  `pwd` varchar(60) NOT NULL,
  `type` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `login`, `pwd`, `type`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'my', 'mymy', 'user'),
(3, 'mohamed', 'mohamed', 'user'),
(4, 'lllllll', 'lllllllllll', 'user'),
(5, 'fff', 'ffff', 'user'),
(6, 'aaa', 'aaaaa', 'user'),
(7, 'aaa', 'aaaaa', 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id_auteur`);

--
-- Index pour la table `catigorie`
--
ALTER TABLE `catigorie`
  ADD PRIMARY KEY (`id_catigorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`code_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`ref_cmd`),
  ADD KEY `fk_cl` (`code_client`),
  ADD KEY `fk_pan` (`id_pannier`),
  ADD KEY `fk_livr` (`Num_livraison`);

--
-- Index pour la table `editeur`
--
ALTER TABLE `editeur`
  ADD PRIMARY KEY (`id_editeur`);

--
-- Index pour la table `ligne_pannier`
--
ALTER TABLE `ligne_pannier`
  ADD PRIMARY KEY (`id_pannier`,`id_livre`),
  ADD KEY `fk_li` (`id_livre`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`Num_livraison`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id_livre`);

--
-- Index pour la table `pannier`
--
ALTER TABLE `pannier`
  ADD PRIMARY KEY (`id_pannier`),
  ADD KEY `id_livre` (`id_livre`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pannier`
--
ALTER TABLE `pannier`
  MODIFY `id_pannier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_cl` FOREIGN KEY (`code_client`) REFERENCES `client` (`code_client`),
  ADD CONSTRAINT `fk_livr` FOREIGN KEY (`Num_livraison`) REFERENCES `livraison` (`Num_livraison`);

--
-- Contraintes pour la table `ligne_pannier`
--
ALTER TABLE `ligne_pannier`
  ADD CONSTRAINT `fk_li` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id_livre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
