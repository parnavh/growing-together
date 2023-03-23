import React from 'react'
import { IconBrandGoogle } from '@tabler/icons-react';

export default function GoogleSignIn() {
  return (
    <div className=''>
      <a className='flex mx-auto px-4 py-3 rounded-md bg-[#FFFFFF] items-center gap-2 no-underline' href=""><IconBrandGoogle/> Sign in with Google</a>
    </div>
  )
}
