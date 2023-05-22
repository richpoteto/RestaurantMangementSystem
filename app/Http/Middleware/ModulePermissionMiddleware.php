<?php

namespace App\Http\Middleware;

use App\CentralLogics\Helpers;
use Brian2694\Toastr\Facades\Toastr;
use Closure;

class ModulePermissionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next, $module)
    {
        if (auth('admin')->check() && Helpers::module_permission_check($module)) {
            return $next($request);
        }
        else if (auth('vendor_employee')->check() || auth('vendor')->check()) {
            if(Helpers::employee_module_permission_check($module))
            {
                return $next($request);
            }
        }

        Toastr::error(trans('messages.access_denied'));
        return back();
    }
}
