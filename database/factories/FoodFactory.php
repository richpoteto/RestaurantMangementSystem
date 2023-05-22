<?php

namespace Database\Factories;

use App\Models\Food;
use Illuminate\Database\Eloquent\Factories\Factory;

class FoodFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Food::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $categoru_id = $this->faker->numberBetween(5,38);
        return [
            'name' => $this->faker->name(),
            'description' => $this->faker->text(),
            'image' => '2021-05-18-60a3e590d6811.png',
            'category_ids' => '[{"id":"1","position":1},{"id":"'.$categoru_id.'","position":2}]',
            'category_id'=>$categoru_id,
            'variations'=> '[{"type":"Red-L","price":120},{"type":"Red-S","price":100},{"type":"White-L","price":120},{"type":"White-S","price":100}]',
            'add_ons'=>'[]',
            'attributes'=>'["2","1"]',
            'choice_options'=> '[{"name":"choice_2","title":"Color","options":["Red","White"]},{"name":"choice_1","title":"Size","options":["L","S"]}]',
            'price'=>$this->faker->randomNumber(2),
            'available_time_starts'=> '10:00:00',
            'available_time_ends'=> '22:00:00',
            'restaurant_id'=>$this->faker->randomElement([3,4,5]),
            'discount'=>$this->faker->numberBetween(0,100),
            'discount_type'=>$this->faker->randomElement(['percent','amount']),
            'veg'=>$this->faker->randomElement([0,1]),
        ];
    }
}
