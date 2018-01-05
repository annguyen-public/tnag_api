<?php
// app/database/factories/TaskFactory.php
use Faker\Generator as Faker;
$factory->define(App\Recipe::class, function (Faker $faker) {
    $users = App\User::pluck('id')->toArray();
    return [
        'name' => $faker->unique()->name,
        'ingredient_count' => $faker->numberBetween(1, 10),
        'direction_count' => $faker->numberBetween(1, 10),
        'img_url' => $faker->randomElement(),
        'point' => $faker->numberBetween(1, 10),
        'user_id' => $faker->randomElement($users)
    ];
});