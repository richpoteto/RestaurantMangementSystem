<?php

namespace App\Console\Commands;

use App\CentralLogics\Helpers;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use Madnest\Madzipper\Facades\Madzipper;

class InstallablePackage extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'prepare:installable';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create an installable package.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        /*Helpers::remove_dir('.idea');*/
        Artisan::call('debugbar:clear');
        Helpers::remove_dir('storage/app/public');
        Storage::disk('public')->makeDirectory('/');
        Madzipper::make('installation/backup/public.zip')->extractTo('storage/app');

        $dot_env = base_path('.env');
        $new_env = base_path('.env.example');
        copy($new_env, $dot_env);

        $routes = base_path('app/Providers/RouteServiceProvider.php');
        $new_routes = base_path('installation/activate_install_routes.txt');
        copy($new_routes, $routes);
    }
}
