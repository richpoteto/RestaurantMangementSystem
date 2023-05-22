<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Review;

class ReviewFactory extends Factory
{
        /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Review::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'food_id' => $this->faker->numberBetween(1,5000),
            'user_id'=> $this->faker->numberBetween(1,153701),
            'order_id'=> $this->faker->numberBetween(1,297950),
            'item_campaign_id' => null,
            'comment' => $this->faker->name(),
            'rating' => $this->faker->numberBetween(1,5),
            'created_at' => now(),
            'updated_at' => now()
        ];
    }
}
