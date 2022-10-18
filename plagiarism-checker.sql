-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2022 at 06:02 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plagiarism-checker`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add proposal', 7, 'add_proposal'),
(26, 'Can change proposal', 7, 'change_proposal'),
(27, 'Can delete proposal', 7, 'delete_proposal'),
(28, 'Can view proposal', 7, 'view_proposal'),
(29, 'Can add user profile', 8, 'add_userprofile'),
(30, 'Can change user profile', 8, 'change_userprofile'),
(31, 'Can delete user profile', 8, 'delete_userprofile'),
(32, 'Can view user profile', 8, 'view_userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$JwF5GWDzci7o173rFfnK1N$4xCYw/i8gTMGG8mxGh5Uixr85bCWrotzexv49SIGyyQ=', '2022-10-18 14:42:02.837699', 1, 'imboyo', '', '', '', 1, 1, '2022-10-18 14:16:00.995796'),
(2, 'pbkdf2_sha256$260000$TSBr80H18iyCAGffL0eALA$Z1OAwpVSMfgObxhTh1xYeGC7zgBDj0lYAlKx61oAskw=', NULL, 0, 'muhammad_alwin', 'MUHAMMAD', 'ALWIN', 'johndoe@gmail.com', 0, 1, '2022-10-18 14:53:31.622315'),
(3, 'pbkdf2_sha256$260000$jpvpJ7Wl2yw1hRTRICpvqS$Dzr2rVrYK+692iJro+7JRrX0RSrOtTLLlNXA71+P09U=', NULL, 0, 'dolly_indra', 'Dr.', 'Ir. Dolly Indra, S.Kom., MM.,MTA', 'dollyindra@gmail.com', 0, 1, '2022-10-18 14:54:48.968687'),
(4, 'pbkdf2_sha256$260000$evdjYXN1DMo1l8SoP1qbom$ngTU0tiQL7mdqcjaV9I+oXKTo+hX6GxfiLvhmc6S+aw=', NULL, 0, 'm_zulkifli', 'M', ': ZULKIFLI', 'm_zulkfli@gmail.com', 0, 1, '2022-10-18 14:57:54.123459'),
(5, 'pbkdf2_sha256$260000$oClgpHU67win4nTBHdE2tI$ktq4E7ZEDAUtyi2kPDbo/gLVjD4wjOocvRUTWZZH564=', NULL, 0, 'purnawansyah', 'Ir.', 'Purnawansyah, M.Kom., M.TA', 'purnawansyah@gmail.com', 0, 1, '2022-10-18 15:03:55.278324'),
(6, 'pbkdf2_sha256$260000$51PPHDBi7BHLihKW4FOIx6$1iqhl9uryeSBcQ0hHkzeBbUZPqceScB99LNljOcMhpc=', NULL, 0, 'ahmad_faisal', 'M.', 'AHMAD FAISAL', 'ahmadfaisal@gmail.com', 0, 1, '2022-10-18 15:06:51.439450'),
(7, 'pbkdf2_sha256$260000$QeONpic0KGqg09T4pvgoBa$L32Q6YVGCdHM0QRprpjkbwYyuRD9PEB140II69loSAA=', NULL, 0, 'siska_anraena', 'Siska', 'Anraena, S.Kom., M.T', 'siska_anraena@gmail.com', 0, 1, '2022-10-18 15:08:28.279391'),
(8, 'pbkdf2_sha256$260000$dpAt33nviQUWTygO75JVX3$c9I+1nnVArOkP8qExBFw8rcGNzwGoqbdjuR3osP/TMo=', NULL, 0, 'fadzlul_rahman', 'Fadzlul', 'Rahman Hamja', 'fadzlul_rahman@gmail.com', 0, 1, '2022-10-18 15:19:00.235045'),
(9, 'pbkdf2_sha256$260000$ygQQMmq4al9kEkxe8KgNNj$LHHf1V4MAyag0pEebGH+zjJ7hWMZDSATpvUVMkCG8ok=', NULL, 0, 'farniwati_fattah', 'Ir.', 'Farniwati Fattah, S.T.,M.T.,MTA', 'farniwati@gmail.com', 0, 1, '2022-10-18 15:19:44.729534'),
(10, 'pbkdf2_sha256$260000$MckysMpsVWkAtfn3rdlaCx$jGgePIPIXWdcdiJB1eMvxDfyYx23MMXtRHHcTSwSmfo=', NULL, 0, 'khofifa_nur', 'KHOFIFAH', 'NUR PURNAMASARI', 'khofifa_nur@gmail.com', 0, 1, '2022-10-18 15:23:12.787984'),
(11, 'pbkdf2_sha256$260000$TqkrI9dUGd9AtjYfBBaANu$eFC0+pIQqj07xYralg7b9HxVb6UsOUniH+U5wTBi3gM=', NULL, 0, 'hajrah_mansyur', 'Ir.', 'St. Hajrah Mansyur, S.Kom.,M.Cs., MTA', 'hajrah@gmail.com', 0, 1, '2022-10-18 15:23:47.650616'),
(12, 'pbkdf2_sha256$260000$FJIVLVVMYUhVP3JhED2b1n$2WlcBUNyfYxMlhwiAnmzhNQZF4LOF81+JrdfP0x0vmY=', NULL, 0, 'ZULFAHMI', 'ZULFAHMI', '', 'zulfahmi@gmail.com', 0, 1, '2022-10-18 15:24:15.225211'),
(13, 'pbkdf2_sha256$260000$SK3hUa2zJWsYYGt0sPSdiR$jRawKic2nUWeBejlaZNQwzLIY5kH3tKwKWNrZ6wPb7g=', NULL, 0, 'Farniwati', 'Farniwati', 'Fattah, S.T., M.T., MTA', 'Farniwati@gmail.com', 0, 1, '2022-10-18 15:24:41.473039'),
(14, 'pbkdf2_sha256$260000$m4gmsTsP1WEnzjkk8lytMf$Qss91b4mxKvCTZEfxaYQUeyOMeHTXfOgw6n4zi/xx7g=', NULL, 0, 'zulfadlil', 'Zulfadlil', 'Ridhatul Habsyur', 'zulfadlil@gmail.com', 0, 1, '2022-10-18 15:25:24.675364'),
(15, 'pbkdf2_sha256$260000$NTo8NWcAN7aVAU0YcWuyKc$9ylFwcAip5ujp/tOV361HlXiLJCvQ/CNt92zqP0Posk=', NULL, 0, 'anonym', 'Anonymous', '', 'anonym@gmail.com', 0, 1, '2022-10-18 15:25:42.935484'),
(16, 'pbkdf2_sha256$260000$e1vuRfA3yq8XrUe38XDlxV$X1C5swodUH6vrps5edl+qbkV2eG34KJ4WuYXZqxn2d0=', NULL, 0, 'abdul_husrah', 'Abdul', 'Husrah Hairah Islami', 'abdulhusrah@gmail.com', 0, 1, '2022-10-18 15:26:33.556019'),
(17, 'pbkdf2_sha256$260000$RKR3odEwgvrMc87nuzlNXg$sxQ1I+K1WHHz+T0ACuhipYy0CoM9NsXgB7KaSAziSmE=', NULL, 0, 'irawati', 'Irawati,S.Kom.,M.T.,MTA', '', 'irawati@gmail.com', 0, 1, '2022-10-18 15:27:00.733102'),
(18, 'pbkdf2_sha256$260000$DfSt9KIbvpaPnzKJSPF20H$Ftp2kkqxrEXnWzqzwYbcr0AXmh7gvektHX5csrU8tHQ=', NULL, 0, 'amaliah_chindy', 'AMALIAH', 'CHINDY SARUNGGAGA', 'amaliah@gmail.com', 0, 1, '2022-10-18 15:27:26.176105'),
(19, 'pbkdf2_sha256$260000$U6A9qXFKQxnC4BJZlPuess$EwfvH5LIcnaObbUSKFAQpK/Zt7W/c2Ytk7f/Me1DLDw=', NULL, 0, 'Yulita_salim', 'Yulita', 'Salim, S.Kom., M.T', 'Yulita@gmail.com', 0, 1, '2022-10-18 15:27:52.253234'),
(20, 'pbkdf2_sha256$260000$Z3GBZodUfdXZkh5FJrMxh0$S71scv5L8IlkkM2YkwmFjliCDzV6cA/QNeKGm9VZjhc=', NULL, 0, 'nurfajriana', 'NURFAJRIANA', '', 'nurfajriana@gmail.com', 0, 1, '2022-10-18 15:28:21.109397'),
(21, 'pbkdf2_sha256$260000$sdBlEStJBvYiGLxOT8Uvxv$HV72kVmbUx9i0MP1QV0VarIaw3QDnDJsKfkKBfEoZXs=', NULL, 0, 'putri_aulia', 'Putri', 'Aulia', 'putriAulia@gmail.com', 0, 1, '2022-10-18 15:29:10.380349'),
(22, 'pbkdf2_sha256$260000$SyWHGGliKcKpSLbxg2h0Cb$xdx1ouGRR+ItKTN/0aDPsh/34lWItYqwoNRS4qBFH6s=', NULL, 0, 'FITRIANI', 'FITRIANI', '', 'FITRIANI@gmail.com', 0, 1, '2022-10-18 15:29:34.835169'),
(23, 'pbkdf2_sha256$260000$P1AEscIXTUrT9iRMj9cBc4$NwfOvkKrCG/ZWh6bQ1KXpIG0vrfxeNWO7lGLd0nd7bE=', NULL, 0, 'fitriyani', 'Fitriyani', 'Umar, S.Si., M.Eng.,MTA', 'fitriyani@gmail.com', 0, 1, '2022-10-18 15:30:06.176257'),
(24, 'pbkdf2_sha256$260000$qUykrNsPmtkcleb1SjzJVv$p+qf4ZdNgkLdtxKGCl/9UGwH5ic/NkLZnwiVGPGBpHU=', NULL, 0, 'andi_maulida', 'ANDI', 'MAULIDA ARGINA', 'andi@gmail.com', 0, 1, '2022-10-18 15:30:31.963025'),
(25, 'pbkdf2_sha256$260000$mq7qKuPAESXqDLN5Ry7xZc$LFlExnTDe0jkEr5Li6fHixHAxyQeSUJHlsZmeWwurMU=', NULL, 0, 'andi_tenri_ita', 'ANDI', 'TENRI ITA MAHARANI', 'andi_tenri@gmail.com', 0, 1, '2022-10-18 15:31:51.022408'),
(26, 'pbkdf2_sha256$260000$5ut2YtdzXk74TsUzcUxXTM$NyS6t4whh1sf5ab+Iunh/fEmazM/qQBGB082C4mVsYc=', NULL, 0, 'poetri_lestari', 'Poetri', 'Lestari Lokapitasari B. S.Kom. M.T., MTA', 'poetri@gmail.com', 0, 1, '2022-10-18 15:32:24.046515'),
(27, 'pbkdf2_sha256$260000$jiH5sOUkfIabhwIeOcYDV4$tObJBNL2ecdRBFgNicqQL6/aSVNVfiadQtlwrYYViPg=', NULL, 0, 'muh_afdal', 'MUH.', 'AFDAL MAULANA SAID', 'muh_afdal@gmail.com', 0, 1, '2022-10-18 15:37:11.499094'),
(28, 'pbkdf2_sha256$260000$uh9Y5hgIbYjacMKUFB6BRh$bYQu82rVJKvICyoFEoltOMYFMXN74NMH+53J/dyKyfQ=', NULL, 0, 'richa_sriant', 'Richa', 'Sriant', 'richa@gmail.com', 0, 1, '2022-10-18 15:38:28.662320'),
(29, 'pbkdf2_sha256$260000$GGdU5mbrwrVyTn1HW4i2lG$9lx3mUhTK4BsG12l5p+W+Dk3xrd4VpdpnNGlfI1+qwY=', NULL, 0, 'herdianti', 'Ir.', 'Herdianti, S.Si., M.Eng., MTA', 'herdianti@gmail.com', 0, 1, '2022-10-18 15:38:57.368671');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-10-18 14:42:09.699682', '1', 'UserProfile object (1)', 1, '[{\"added\": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'proposal', 'proposal'),
(6, 'sessions', 'session'),
(8, 'user', 'userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-10-18 14:14:48.848306'),
(2, 'auth', '0001_initial', '2022-10-18 14:14:49.590507'),
(3, 'admin', '0001_initial', '2022-10-18 14:14:49.786721'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-10-18 14:14:49.794727'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-10-18 14:14:49.801735'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-10-18 14:14:49.876194'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-10-18 14:14:49.943255'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-10-18 14:14:49.961272'),
(9, 'auth', '0004_alter_user_username_opts', '2022-10-18 14:14:49.972303'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-10-18 14:14:50.019347'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-10-18 14:14:50.021348'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-10-18 14:14:50.032358'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-10-18 14:14:50.052377'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-10-18 14:14:50.068391'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-10-18 14:14:50.080403'),
(16, 'auth', '0011_update_proxy_permissions', '2022-10-18 14:14:50.089410'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-10-18 14:14:50.107427'),
(18, 'proposal', '0001_initial', '2022-10-18 14:14:50.319827'),
(19, 'proposal', '0002_auto_20220725_0921', '2022-10-18 14:14:50.520189'),
(20, 'proposal', '0003_alter_proposal_title', '2022-10-18 14:14:50.532200'),
(21, 'proposal', '0004_alter_proposal_file', '2022-10-18 14:14:50.550216'),
(22, 'sessions', '0001_initial', '2022-10-18 14:14:50.589251'),
(23, 'user', '0001_initial', '2022-10-18 14:14:50.717368'),
(24, 'user', '0002_alter_userprofile_nomor_induk', '2022-10-18 14:14:50.781183');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c3a7r7fto1rpoyy37x3k56365885mo2v', '.eJxVjEsOwjAMBe-SNYqStA41S_Y9Q2Q7DimgVupnhbg7VOoCtm9m3ssk2taatkXnNGRzMd6cfjcmeei4g3yn8TZZmcZ1Htjuij3oYvsp6_N6uH8HlZb6rSWgAwByEApCDJQbZO60dS1HQNZz9MUJYpuxQ20KiWDjlUoB9UXM-wPS0jhI:1oknn8:_LHT0gw9CKWYKbZ-4AdtMpZnXLINb1W6wHnSy3t2M6U', '2022-11-01 14:42:02.845576');

-- --------------------------------------------------------

--
-- Table structure for table `proposal_proposal`
--

CREATE TABLE `proposal_proposal` (
  `id` bigint(20) NOT NULL,
  `title` varchar(300) NOT NULL,
  `file` varchar(300) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `plagiarism_percentage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proposal_proposal`
--

INSERT INTO `proposal_proposal` (`id`, `title`, `file`, `created_at`, `plagiarism_percentage`) VALUES
(1, 'OBJEK DETECTION DAN TRACKING MENGGUNAKAN ALGORITMA YOU ONLY LOOK ONC', 'proposal/OBJECT_DETECTION_DAN_TRACKING_MENGGUNAKAN_ALGORITMA_YOLO_BERBASIS_COMPUTER_VISION_Format_Baru-15-37_1.pdf', '2022-10-18 14:55:55.030171', 0),
(2, 'SISTEM REKOMENDASI PEMILIHAN KOMPONEN PERSONAL COMPUTER (PC) DENGAN MENGGUNAKAN METODE ITEM BASED COLLABORATIVE', 'proposal/Proposal_ZULKIFLI-8-23_1.pdf', '2022-10-18 15:05:52.463628', 30),
(3, 'PENERAPAN TEKNOLOGI QR CODE PADA APLIKASI ABSENSI ONLINE PEGAWAI DINAS PEKERJAAN UMUM BERBASIS ANDROID.', 'proposal/proposal_faisalfix-15-48.pdf', '2022-10-18 15:10:03.952195', 29),
(4, 'RANCANG BANGUN PENGONTROLAN PINTU RUMAH BERDASARKAN GAMBAR WAJAH TAMU BERBASIS Internet Of Things', 'proposal/Perbaikan_Proposal_FADZLUL_RAHMAN_HAMJA_1-15-40.pdf', '2022-10-18 15:20:22.616974', 29),
(5, 'APLIKASI PENGINGAT JADWAL SERVIS MOBIL BERBASIS ANDROID MENGGUNAKAN METODE PUSH NOTIFICATION', 'proposal/Proposal_Khofifah_Nur_Purnamasari__13020170011-dikonversi_1-dikonversi_1_1-15-42.pdf', '2022-10-18 15:39:34.192937', 31),
(6, 'IMPLEMENTASI BOT TELEGRAM UNTUK KEAMANAN KEBAKARAN PADA RUMAH BERBASIS MIKROKONTROLLER', 'proposal/PERBAIKAN_PROPOSAL_ZULFAHMI_13020170069_1-12-28_1.pdf', '2022-10-18 15:40:16.242591', 30),
(7, 'PERANCANGAN APLIKASI PENGINGAT JADWAL KHUTBAH JUMAT PADA KOTA PAREPARE BERBASIS WEB MENGGUNAKAN NOTIFIKASI BOT TELEGRAM', 'proposal/PROPOSAL_ZULFADLIL_fixx-10-23_1.pdf', '2022-10-18 15:42:22.704309', 30),
(8, 'Aplikasi Siaga Sunting Untuk Mengukur Status Gizi Balita Berbasis Mobile', 'proposal/00000592-Salin3-Proposal_Husra-10-25_3.pdf', '2022-10-18 15:43:58.397795', 0),
(9, 'IMPLEMENTASI METODE KRIPTOGRAFI DALAM PENGAMANAN RECORD DATABASE', 'proposal/Proposal_cin-14-26.pdf', '2022-10-18 15:45:19.631465', 30),
(10, 'PERANCANGAN APLIKASI STOK DARAH BERBASIS WEBSITE MENGGUNAKAN METODE FIRST IN FIRST OUT (STUDI KASUS PMI BONE)', 'proposal/Perancangan_Aplikasi_Stok_Darah_Berbasis_Website_Menggunakan_Metode_FIFO_Studi_Kasus_PMI_BONE-11-24_1.pdf', '2022-10-18 15:45:57.804245', 33),
(11, 'NALISIS PERBANDINGAN METODE KLASIFIKASI KNEAREST NEIGHBOR (KNN) DAN NAIVE BAYES CLASSIFIER (NBC) PADA DATASET PENYAKIT STROKE', 'proposal/Proposal_Putri_Aulia_13020170091-2_1-12-24.pdf', '2022-10-18 15:50:45.673154', 31),
(12, 'PERANCANGAN APLIKASI PENGENALAN FLORA YANG DILINDUNGI DI INDONESIA PADA ANAK-ANAK BERBASIS AUGMENTED REALITY (STUDI KASUS SDN 12 KABAWO PROVINSI SULAWESI TENGGARA)', 'proposal/Revisi_8_Fitriani-16-36.pdf', '2022-10-18 15:51:33.491137', 31),
(13, 'ANALISIS PERBANDINGAN METODE KLASIFIKASI K-NEAREST NEIGHBOR DAN NAIVE BAYES CLASSIFIER PADA DATASET MULTICLASS PENYAKIT', 'proposal/Proposal_Andi_Maulida_Argina_13020170112-16-34.pdf', '2022-10-18 15:52:02.968153', 30),
(14, 'IMPLEMENTASI DECISION SUPPORT SYSTEM MENGGUNAKAN METODE ELECTRE DALAM PEMILIHAN PRODUK UNGGULAN DAERAH KABUPATEN BULUKUMBA, userM;ANDI TENRI ITA MAHARAN', 'proposal/PERBAIKAN_7__PROPOSAL_ANDI_TENRI_ITA-14-30_1.pdf', '2022-10-18 15:53:10.229351', 30),
(15, 'ANALISIS KLASIFIKASI PENYAKIT PARU-PARU PADA ANAK MENGGUNAKAN METODE NAIVE BAYES CLASSIFIER', 'proposal/PROPOSAL_13020170208_Afdal_Maulana-13-27.pdf', '2022-10-18 15:54:17.901913', 31),
(16, 'SISTEM PENDUKUNG KEPUTUSAN PEMILIHAN JENIS DIET UNTUK PENDERITA DIABETES MELITUS MENGGUNAKAN METODE ANALYTICAL HIERARCHY PROCESS', 'proposal/14._Laporan_Proposal_Lembar_Perbaikan_dan_Pengesahan_Proposal_-_Mahasiswa4-11-20.pdf', '2022-10-18 15:56:27.621392', 29);

-- --------------------------------------------------------

--
-- Table structure for table `proposal_proposal_dosen`
--

CREATE TABLE `proposal_proposal_dosen` (
  `id` bigint(20) NOT NULL,
  `proposal_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proposal_proposal_dosen`
--

INSERT INTO `proposal_proposal_dosen` (`id`, `proposal_id`, `user_id`) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 3, 6),
(4, 4, 8),
(5, 5, 10),
(6, 6, 12),
(7, 7, 14),
(8, 8, 16),
(9, 9, 18),
(10, 10, 20),
(11, 11, 21),
(12, 12, 22),
(13, 13, 24),
(14, 14, 25),
(15, 15, 27),
(16, 16, 28);

-- --------------------------------------------------------

--
-- Table structure for table `proposal_proposal_mahasiswa`
--

CREATE TABLE `proposal_proposal_mahasiswa` (
  `id` bigint(20) NOT NULL,
  `proposal_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proposal_proposal_mahasiswa`
--

INSERT INTO `proposal_proposal_mahasiswa` (`id`, `proposal_id`, `user_id`) VALUES
(1, 1, 3),
(2, 2, 5),
(3, 3, 7),
(4, 4, 9),
(5, 5, 11),
(6, 6, 9),
(7, 7, 15),
(8, 8, 17),
(9, 9, 19),
(10, 10, 17),
(11, 11, 5),
(12, 12, 23),
(13, 13, 5),
(14, 14, 26),
(15, 15, 15),
(16, 16, 29);

-- --------------------------------------------------------

--
-- Table structure for table `user_userprofile`
--

CREATE TABLE `user_userprofile` (
  `id` bigint(20) NOT NULL,
  `nomor_induk` varchar(15) NOT NULL,
  `role` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_userprofile`
--

INSERT INTO `user_userprofile` (`id`, `nomor_induk`, `role`, `user_id`) VALUES
(1, 'B011171365', 'admin', 1),
(2, '-----', 'mahasiswa', 2),
(3, '-----', 'dosen', 3),
(4, '-----', 'mahasiswa', 4),
(5, '-----', 'dosen', 5),
(6, '-----', 'mahasiswa', 6),
(7, '-----', 'dosen', 7),
(8, '-----', 'mahasiswa', 8),
(9, '-----', 'dosen', 9),
(10, '-----', 'mahasiswa', 10),
(11, '-----', 'dosen', 11),
(12, '-----', 'mahasiswa', 12),
(13, '-----', 'dosen', 13),
(14, '-----', 'mahasiswa', 14),
(15, '-----', 'dosen', 15),
(16, '------', 'mahasiswa', 16),
(17, '------', 'dosen', 17),
(18, '-----', 'mahasiswa', 18),
(19, '-----', 'dosen', 19),
(20, '------', 'mahasiswa', 20),
(21, '-----', 'mahasiswa', 21),
(22, '-----', 'mahasiswa', 22),
(23, '------', 'dosen', 23),
(24, '------', 'mahasiswa', 24),
(25, '------', 'mahasiswa', 25),
(26, '------', 'dosen', 26),
(27, '-----', 'mahasiswa', 27),
(28, '-----', 'mahasiswa', 28),
(29, '-----', 'dosen', 29);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `proposal_proposal`
--
ALTER TABLE `proposal_proposal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_proposal_dosen`
--
ALTER TABLE `proposal_proposal_dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proposal_proposal_dosen_proposal_id_user_id_9a5c6897_uniq` (`proposal_id`,`user_id`),
  ADD KEY `proposal_proposal_dosen_user_id_8873e385_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `proposal_proposal_mahasiswa`
--
ALTER TABLE `proposal_proposal_mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `proposal_proposal_mahasiswa_proposal_id_user_id_054be07f_uniq` (`proposal_id`,`user_id`),
  ADD KEY `proposal_proposal_mahasiswa_user_id_ef877381_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `user_userprofile`
--
ALTER TABLE `user_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `proposal_proposal`
--
ALTER TABLE `proposal_proposal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `proposal_proposal_dosen`
--
ALTER TABLE `proposal_proposal_dosen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `proposal_proposal_mahasiswa`
--
ALTER TABLE `proposal_proposal_mahasiswa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_userprofile`
--
ALTER TABLE `user_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `proposal_proposal_dosen`
--
ALTER TABLE `proposal_proposal_dosen`
  ADD CONSTRAINT `proposal_proposal_do_proposal_id_8ee3f2af_fk_proposal_` FOREIGN KEY (`proposal_id`) REFERENCES `proposal_proposal` (`id`),
  ADD CONSTRAINT `proposal_proposal_dosen_user_id_8873e385_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `proposal_proposal_mahasiswa`
--
ALTER TABLE `proposal_proposal_mahasiswa`
  ADD CONSTRAINT `proposal_proposal_ma_proposal_id_d7e78929_fk_proposal_` FOREIGN KEY (`proposal_id`) REFERENCES `proposal_proposal` (`id`),
  ADD CONSTRAINT `proposal_proposal_mahasiswa_user_id_ef877381_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_userprofile`
--
ALTER TABLE `user_userprofile`
  ADD CONSTRAINT `user_userprofile_user_id_2474538d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
