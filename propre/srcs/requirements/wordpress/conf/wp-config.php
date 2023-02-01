<?php
define('DB_NAME', 'vDB_NAME');
define('DB_USER', 'vDB_USER');
define('DB_PASSWORD', 'vDB_PSWD');
define('DB_HOST', 'vDB_HOST');
define('DB_CHARSET', 'vDB_CHARSET');
define('DB_COLLATE', 'vDB_COLLATE');
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);

$table_prefix = 'wp_';
if (!defined('ABSPATH'))
  define('ABSPATH', DIR . '/');
require_once ABSPATH . 'wp-settings.php';
