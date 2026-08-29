-- mod-tcg-vendors: boss drop cooldown state
-- Apply to: characters database
--
-- Single-row table persisting the UTC unix timestamp of the last successful
-- boss stationery drop, so TCGVendors.BossDrop.CooldownHours is enforced
-- server-wide even across restarts.

CREATE TABLE IF NOT EXISTS `mod_tcg_vendors_state` (
    `id`             TINYINT UNSIGNED   NOT NULL DEFAULT 1
                                        COMMENT 'Always 1 — single-row state table',
    `last_drop_time` BIGINT UNSIGNED    NOT NULL DEFAULT 0
                                        COMMENT 'UTC unix timestamp of the last successful boss stationery drop',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COMMENT='Tracks the boss drop cooldown state (mod-tcg-vendors)';
