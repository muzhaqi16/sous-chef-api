BEGIN;

INSERT INTO groceries (name,category,"location",expiry_reminder,expiry_date,quantity,unit,notes,price,image,user_id) VALUES 
('Ice Cream','Frozen','Freezer',false,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'strawberry_ice_cream',2),
('Apples','Fruits','Fridge',true,'2019-08-10',1,'container','Green crispy apples',2.45,'green_apple',2),
('Oranges','Fruits','Fridge',false,'2019-08-10',1,'container','Big oranges',1.95,'orange',2),
('Turkey Bacon','Frozen','Freezer',true,'2019-08-10',1,'container','',4.50,'bacon',2),
('Paprika','Herbs and Spices','Pantry',true,'2019-08-10',1,'container','sweet',7.45,'paprika',2),
('Cumin','Herbs and Spices','Pantry',true,'2019-08-10',1,'container','McCormick',1.45,'cumin',2),
('Ice Cream','Frozen','Freezer',true,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'undefined',2),
('Ice Cream','Frozen','Freezer',true,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'undefined',2),
('Ice Cream','Frozen','Freezer',false,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'undefined',2),
('Ice Cream','Frozen','Freezer',true,'2019-08-10',1,'container','Friendlys Butter Pecan',3.45,'undefined',2)
;

COMMIT;