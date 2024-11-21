-- DELETE entries with specified IDs
DELETE FROM `item_template` WHERE `entry` IN (4427, 3512, 38996, 41606, 38567);

INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `bonding`, `description`, `VerifiedBuild`) VALUES
(4427, 0, 6, 'Scroll of Deception', 6270, 4, 268435520, 38165, 0, 0, 1, '|cff0BF917Use: Replicates the appearance of an item into an Essence.|r', 1), -- Replicate items up to Epic quality into essence.
(3512, 0, 6, 'Scroll of Illusion', 1096, 4, 268435520, 38165, 0, 0, 1, '|cff0BF917Use: Replicates the appearance of an item into an Essence.|r', 1), -- Replicate Legendary items into essence.
(38996, 0, 6, 'Scroll of Purification', 811, 4, 268435520, 38165, 0, 0, 1, '|cff0BF917Use: Restores the original appearance of an item.|r', 1), -- Restore appearance of an item.
(41606, 0, 6, 'Scroll of Translucency', 42717, 4, 268435520, 38165, 0, 0, 1, '|cff0BF917Use: Hides the appearance of a piece of armor.|r', 1), -- Hide a piece of armor.
(38567, 0, 6, 'Essence of Placeholder', 5563, 4, 268435520, 38165, 0, 0, 1, '|cff0BF917Use: Apply the Placeholder appearance to another item.|r', 1); -- Placeholder should be renamed and populated with item name that essence was extracted, onuser login? (https://elunaluaengine.github.io/?search=object%3A%3Aset)


-- Track extracted Essences, and replace Placeholder with `original_item_name` on user login.
CREATE TABLE IF NOT EXISTS `essence_tracking` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,             -- Unique ID for each record
    `essence_item_id` INT NOT NULL,                  -- ID of the essence item from 'item_instance'
    `original_item_name` VARCHAR(255) NOT NULL,      -- Name of the original item
    `owner_guid` INT NOT NULL,                       -- GUID of the owning character
    --`applied` TINYINT(1) NOT NULL DEFAULT 0          -- Indicates if the essence has been applied; Not needed anymore essence must be cleared from the table.
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
