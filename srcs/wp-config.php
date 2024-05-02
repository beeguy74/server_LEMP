<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '>iR}oRBv0<WjXG*/f,&=S3Av748|GeCb0ql]Q$XgH|1$T.CD+z]K%K{UQ-Sw]fh4');
define('SECURE_AUTH_KEY',  ';{e.9~3$*jvmOm_+Ufh@}D=a_@4g_ZfzoEl6+BeH>N:m/P-2mL)_LRg~/jkdQ``|');
define('LOGGED_IN_KEY',    'i_!9`+t(OXuA!9+,35LRXAJ`.=-Mk@ta!x!G}MCuo@=i{+P5bGQpE<wYDqeagH0R');
define('NONCE_KEY',        '[kyC[;n6;&eKcSN!5BhdJ>*RR7qejD7YZtp]CJq,[v1Ct7p,k1eNMB/J;}]aTBG)');
define('AUTH_SALT',        'rU=6:cAv.|:vrY~dAM[=z]f:s^P.~m,_}+4T~*JYP@F, O!H%/2XLmM4%i|< @7|');
define('SECURE_AUTH_SALT', '-f>%I?SQRpnq_!2y&.9_;2X>e->8]C3qniVK@WwTs!i-|Y16]{xIFpiG#:7.P<{8');
define('LOGGED_IN_SALT',   'xj~47S>SIWe=4lux.CX+#Ydvmsg0BBZx{Rb~*&(SBhur-68}qlLr/o.XD?} KYT!');
define('NONCE_SALT',       '9U(L5hj3-u@>|{az|J~P-&LN[-O#>9|:py i`LPC%UK|r#qD{1Y1VORF,j|;CgeB');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';