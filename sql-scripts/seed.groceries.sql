BEGIN;

INSERT INTO groceries (name,category,"location",expiry_reminder,expiry_date,quantity,unit,notes,price,image) VALUES 
('Ice Cream','Frozen','Freezer',true,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'strawberry_ice_cream'),
('Apples','Fruits','Fridge',true,'2019-08-10',1,'container','Green crispy apples',2.45,'green_apple'),
('Oranges','Fruits','Fridge',true,'2019-08-10',1,'container','Big oranges',1.95,'orange'),
('Turkey Bacon','Frozen','Freezer',true,'2019-08-10',1,'container','',4.50,'bacon'),
('Paprika','Herbs and Spices','Pantry',true,'2019-08-10',1,'container','sweet',7.45,'paprika'),
('Cumin','Herbs and Spices','Pantry',true,'2019-08-10',1,'container','McCormick',1.45,'cumin'),
('Ice Cream','Frozen','Freezer',true,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'undefined'),
('Ice Cream','Frozen','Freezer',true,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'undefined'),
('Ice Cream','Frozen','Freezer',true,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'undefined'),
('Ice Cream','Frozen','Freezer',true,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'undefined')
;

COMMIT;