# basic alien
alien extended from [abstract entity]()

its don't move because its handled by [group alien]()


#### ai
its only shot when near the player on the x axis

#### colision
the amien don't handle the colision with the bullet because we need to update data on both side that interact with its other. So to avoid un-sync data collision is handle on the bullet who call the 'callUpdateBullet()' afterward

